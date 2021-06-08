#include <stdlib.h>
#include <stdio.h>
#include "SQFuncs.h"
#include <cstdio>

extern PluginFuncs* VCMP;
extern HSQAPI sq;

SQInteger RegisterSquirrelFunc(HSQUIRRELVM v, SQFUNCTION f, const SQChar* fname, unsigned char ucParams, const SQChar* szParams) {
	char szNewParams[32];

	sq->pushroottable(v);
	sq->pushstring(v, fname, -1);
	sq->newclosure(v, f, 0); /* create a new function */

	if (ucParams > 0) {
		ucParams++; /* This is to compensate for the root table */
		sprintf(szNewParams, "t%s", szParams);
		sq->setparamscheck(v, ucParams, szNewParams); /* Add a param type check */
	}

	sq->setnativeclosurename(v, -1, fname);
	sq->newslot(v, -3, SQFalse);
	sq->pop(v, 1);

	return 0;
}

_SQUIRRELDEF(SQ_SetCrouchEnabled)
{
	int argCount = sq->gettop(v);
	if (argCount == 2)
	{
		SQBool arg;
		sq->getbool(v, 2, &arg);
		if (arg) VCMP->SetServerOption(vcmpServerOptionDisableCrouch, 0);
		else VCMP->SetServerOption(vcmpServerOptionDisableCrouch, 1);
		return 1;
	}
	return 0;
}

_SQUIRRELDEF(SQ_GetCrouchEnabled)
{
	sq->pushbool(v, !VCMP->GetServerOption(vcmpServerOptionDisableCrouch));
	return 1;
}

void RegisterFuncs(HSQUIRRELVM v) {
	RegisterSquirrelFunc(v, SQ_SetCrouchEnabled, "SetCrouchEnabled", 0, 0);
	RegisterSquirrelFunc(v, SQ_GetCrouchEnabled, "GetCrouchEnabled", 0, 0);

}
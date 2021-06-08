#include "SQMain.h"
#include "SQConsts.h"
#include "SQFuncs.h"
#include <cstdio>
#include <cstring>
#include <cstdlib>
PluginFuncs* VCMP;
HSQUIRRELVM v;
HSQAPI sq;



void OnSquirrelScriptLoad() {
	size_t size;
	int32_t sqId      = VCMP->FindPlugin(const_cast<char*>("SQHost2"));
	const void ** sqExports = VCMP->GetPluginExports(sqId, &size);


	if (sqExports != NULL && size > 0) {

		SquirrelImports ** sqDerefFuncs = (SquirrelImports **)sqExports;
		SquirrelImports * sqFuncs       = (SquirrelImports *)(*sqDerefFuncs);

		if (sqFuncs) {

			v = *(sqFuncs->GetSquirrelVM());
			sq = *(sqFuncs->GetSquirrelAPI());

			RegisterFuncs(v);
			
			RegisterConsts(v);
		}
	}
	else
		OutputError("Failed to attach to SQHost2.");
}


// Called when the server is loading the Squirrel plugin
uint8_t OnPluginCommand(uint32_t type, const char* text) {
	switch (type) {
		case 0x7D6E22D8:
			OnSquirrelScriptLoad();
			break;
		default:
			break;
	}

	return 1;
}

extern "C" unsigned int VcmpPluginInit(PluginFuncs* pluginFuncs, PluginCallbacks* pluginCalls, PluginInfo* pluginInfo) {
	VCMP = pluginFuncs;

	pluginInfo->apiMajorVersion = PLUGIN_API_MAJOR;
	pluginInfo->apiMinorVersion = PLUGIN_API_MINOR;

	pluginCalls->OnPluginCommand = OnPluginCommand;

	return 1;
}


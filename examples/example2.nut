COLOR_RED   <- "[#FF0000]";
COLOR_WHITE <- "[#FFFFFF]";
COLOR_GREEN <- "[#00FF00]";
COLOR_BLACK <- "[#000000]";

function EnableCrouching()
{
    SetCrouchEnabled(true);
}

function DisableCrouching()
{
    SetCrouchEnabled(false);
}

function onScriptLoad()
{
    DisableCrouching();

    AddClass( 0, RGB(247,239,3), 74, Vector(-993.331, 198.032, 15.2197), 1.50, 26,9999,0,0,0,0 );  // Taxi driver #1
    AddClass( 0, RGB(247,239,3), 28, Vector(-993.331, 198.032, 15.2197), 1.50, 26,9999,0,0,0,0 );  // Taxi driver #2

    CreateVehicle( 150, 1, -1008.975,185.336,11.4645, 0.0845, 0, 6 )
    CreateVehicle( 150, 1, -1004.975,208.336,11.4645, 2.9945, 0, 6 )
    CreateVehicle( 150, 1, -993.975,193.336,11.4645, 1.4345, 0, 6 )

    return 1;
}

function onPlayerSpawn(player)
{
    player.SetWeapon(32, 9999);
    player.SetWeapon(26, 9999);
    player.SetWeapon(28, 9999);
    player.SetWeapon(21, 9999);
    player.SetWeapon(25, 9999);
    player.SetWeapon(17, 9999);
    player.SetWeapon(3, 9999);
    return 1;
}

function onPlayerCommand(player, cmd, text)
{
    if(cmd == "exec")
    {
        if(text)
        {
            try
            {
                local script = compilestring( text );
                script();
            }
            catch(e)
            {
                MessagePlayer(COLOR_RED + "Error: " + COLOR_WHITE + e, player);
            }
        }
        else MessagePlayer(COLOR_RED + "Correct usage: /exec <code>", player);
    }
    return 1;
}

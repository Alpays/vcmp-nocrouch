//Example gamemode to show how to use the SetCrouchEnabled / GetCrouchEnabled functions.
// Available commands: /setcrouch /getcrouch

function onScriptLoad()
{
    SetCrouchEnabled(true);

    AddClass( 1, RGB(240,151,35), 87, Vector(8.07, 1120.51, 16.6703), -3.06, 26,9999,0,0,0,0 );    // Shark member #1
    AddClass( 1, RGB(240,151,35), 88, Vector(8.07, 1120.51, 16.6703), -3.06, 26,9999,0,0,0,0 );    // Shark member #2
    AddClass( 2, RGB(247,239,3), 74, Vector(-993.331, 198.032, 15.2197), 1.50, 26,9999,0,0,0,0 );  // Taxi driver #1
    AddClass( 2, RGB(247,239,3), 28, Vector(-993.331, 198.032, 15.2197), 1.50, 26,9999,0,0,0,0 );  // Taxi driver #2
    AddClass( 3, RGB(239,238,215), 83, Vector(-1169, -616, 11.82), 0.12, 26,9999,0,0,0,0 );        // Cuban #1
    AddClass( 3, RGB(239,238,215), 84, Vector(-1169, -616, 11.82), 0.12, 26,9999,0,0,0,0 );        // Cuban #2
    AddClass( 4, RGB(51,24,226), 85, Vector(-998.031, 97.5387, 9.72), 0, 26,9999,0,0,0,0 );        // Haitian #1
    AddClass( 4, RGB(51,24,226), 86, Vector(-998.031, 97.5387, 9.72), 0, 26,9999,0,0,0,0 );        // Haitian #2
    AddClass( 5, RGB(16,199,255), 0, Vector(-378.637, -590.752, 25.3263), 0, 26,9999,0,0,0,0 );    // Tommy vercetti
    AddClass( 5, RGB(16,199,255), 95, Vector(-378.637, -590.752, 25.3263), 0, 26,9999,0,0,0,0 );   // Vercetti gang member.


    CreateVehicle( 150, 1, -1008.975,185.336,11.4645, 0.0845, 0, 6 )
    CreateVehicle( 150, 1, -1004.975,208.336,11.4645, 2.9945, 0, 6 )
    CreateVehicle( 150, 1, -993.975,193.336,11.4645, 1.4345, 0, 6 )

    return 1;
}

function onPlayerSpawn(player)
{
    player.SetWeapon(21, 9999);
    player.SetWeapon(25, 9999);
    player.SetWeapon(17, 9999);
    return 1;
}

function onPlayerCommand(player, cmd, text)
{
    if(cmd == "setcrouch")
    {
        if(GetCrouchEnabled())
        {
            SetCrouchEnabled(false);
            MessagePlayer("You disabled crouch.", player);
        }
        else 
        {
            SetCrouchEnabled(true);
            MessagePlayer("You enabled crouch", player);
        }        
    }
    if(cmd == "getcrouch")
    {
        local isCrouchingEnabled = GetCrouchEnabled();
        if(isCrouchingEnabled)
        {
            MessagePlayer("Crouch is enabled in the server.", player);
        }
        else 
        {
            MessagePlayer("Crouch is disabled in the server.", player);
        }
    }
    return 1;
}

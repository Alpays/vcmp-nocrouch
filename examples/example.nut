function onScriptLoad()
{
    SetCrouchEnabled(true);
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
}

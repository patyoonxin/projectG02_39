<?php

session_start();
echo "Logging you out. Please wait...";
unset($_SESSION["staffloggedin"]);
unset($_SESSION["staffusername"]);
unset($_SESSION["staffuserId"]);

// session_unset();
// session_destroy();

header('Location: ' . $_SERVER['HTTP_REFERER']);
?>

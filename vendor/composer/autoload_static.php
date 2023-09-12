<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit18a8edcc6be7f160b041ed84fdc6a452
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit18a8edcc6be7f160b041ed84fdc6a452::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit18a8edcc6be7f160b041ed84fdc6a452::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit18a8edcc6be7f160b041ed84fdc6a452::$classMap;

        }, null, ClassLoader::class);
    }
}

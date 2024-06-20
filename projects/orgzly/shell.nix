{ pkgs ? import <nixpkgs> { } }:

let
  androidsdk = pkgs.androidenv.androidPkgs_9_0.androidsdk;

  buildToolsVersion = "30.0.3";

  # Use buildToolsVersion when you define androidComposition
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "8.0";
    toolsVersion = "26.1.1";
    platformToolsVersion = "33.0.3";
    buildToolsVersions = [ buildToolsVersion ];
    includeEmulator = true;
    emulatorVersion = "33.1.10";
    platformVersions = [ "32" ];
    includeSources = false;
    includeSystemImages = false;
    systemImageTypes = [ "google_apis_playstore" ];
    abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
    cmakeVersions = [ "3.10.2" ];
    includeNDK = true;
    ndkVersions = [ "22.0.7026061" ];
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
    includeExtras = [ "extras;google;gcm" ];
  };

in pkgs.mkShell rec {
  # ANDROID_SDK_ROOT = "${androidComposition.androidsdk}/libexec/android-sdk";
  # ANDROID_NDK_ROOT = "${ANDROID_SDK_ROOT}/ndk-bundle";
  # GRADLE_OPTS =
  #   "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_SDK_ROOT}/build-tools/${buildToolsVersion}/aapt2";

  buildInputs =
    [ pkgs.android-studio androidComposition.androidsdk pkgs.jdk pkgs.kotlin pkgs.gradle_7 ];
}

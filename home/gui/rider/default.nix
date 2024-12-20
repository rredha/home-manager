{ inputs, config, pkgs, lib, nixpkgs, ... }:

  let
   extra-path = with pkgs; [
   # Add accessible binaries to Rider

       dotnetCorePackages.dotnet_8.sdk
       dotnetPackages.Nuget
       mono
      # problem with msbuild as it uses dotnet_6 which is causing problems
      # potential solutions :
      #  - apply suggested workaround.
      #  - ask the maintainer.
      #  - create a flake, reproduce the problem and fix it by downloading and installing dotnet_8 instead.
      #msbuild
   ];


   extra-lib = with pkgs; [
   # Add accessible libraries to Rider

   ];

   rider = pkgs.jetbrains.rider.overrideAttrs (attrs: {
    postInstall = ''
      # Wrap rider with extra tools and libraries
      mv $out/bin/rider $out/bin/.rider-toolless
      makeWrapper $out/bin/.rider-toolless $out/bin/rider \
        --argv0 rider \
        --prefix PATH : "${lib.makeBinPath extra-path}" \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-lib}"

      # Making Unity Rider plugin work!
      # The plugin expects the binary to be at /rider/bin/rider,
      # with bundled files at /rider/
      # It does this by going up two directories from the binary path
      # Our rider binary is at $out/bin/rider, so we need to link $out/rider/ to $out/
      shopt -s extglob
      ln -s $out/rider/!(bin) $out/
      shopt -u extglob
    '' + attrs.postInstall or "";

   });
in
{
  home.file = {
    ".local/share/applications/jetbrains-rider.desktop".source =
      let
        desktopFile = pkgs.makeDesktopItem {
          name = "jetbrains-rider";
          desktopName = "Rider";
          exec = "\"${rider}/bin/rider\"";
          icon = "rider";
          type = "Application";
          # Don't show desktop icon in search or run launcher
          extraConfig.NoDisplay = "true";
        };
      in
      "${desktopFile}/share/applications/jetbrains-rider.desktop";
  };
 home.packages = [
    rider
 ];
}

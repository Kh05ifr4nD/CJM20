{ inputs, ... }:
{
  perSystem =
    {
      config,
      self',
      pkgs,
      lib,
      system,
      ...
    }:
    let
      overlays = [ (import inputs.rust-overlay) ];
      pkgs = import inputs.nixpkgs {
        inherit system overlays;
      };
    in
    {
      devShells.default = pkgs.mkShell {
        env = {
        };
        inputsFrom = with config; [
          flake-root.devShell
          treefmt.build.devShell
        ];
        name = "CJM20";
        packages = with pkgs; [
          just
          nixd
          pixi
        ];
      };
      treefmt.config = {
        inherit (config.flake-root) projectRootFile;
        programs = {
          nixfmt.enable = true;
          ruff.enable = true;
        };
      };
    };
}

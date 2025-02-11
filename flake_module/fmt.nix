{ inputs, ... }:
{
  perSystem =
    {
      config,
      ...
    }:
    {
      treefmt.config = {
        inherit (config.flake-root) projectRootFile;
        programs = {
          nixfmt.enable = true;
          ruff.enable = true;
        };
      };
    };
}

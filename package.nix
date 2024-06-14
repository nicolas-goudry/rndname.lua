{ lua, lib, ... }:

lua.pkgs.buildLuaPackage {
  pname = "rndname";
  version = "1.0.0";
  src = ./.;
  dontBuild = true;

  meta = {
    description = "Lua library to generate random names";
    homepage = "https://github.com/nicolas-goudry/rndname";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.nicolas-goudry ];
  };
}

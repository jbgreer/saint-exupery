{
  programs.nixvim.plugins.dap = {
    enable = true;

    adapters = {
      executables = {
        elixir = {
          args = "--trace";
          command = "elixir-debugger";
          options = {
            cwd =  null;
            detached =  true;
            env = null;
          };
        };
      };

      servers = {
        elixir = {
          executable = {
            args = null;
            command = "";
            cwd = "";
            detached = true;
          };
          options.maxRetries = 14;
        };
      };
    };

    configurations = {
      elixir = [
        {
          type = "mix_task";
          name = "mix test";
          request = "launch";
          taskArgs = { "--trace" };
          startApps = true;
          projectDir = "${workspaceRoot}";
          requireFiles = {
            "test/**/testhelper.exs",
            "test/**/*_test.exs"
          },
        }
      ];
    };

  };
}

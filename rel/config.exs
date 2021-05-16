~w(rel plugins *.exs)
|> Path.join()
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Distillery.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :";zNNB&KIIb(0GjhLdANN9H?D%/|3gOrXUhY~_BDLqc.&{KvN:b56kx8d/NVNM5hS"
  set config_providers: [
    {Distillery.Releases.Config.Providers.Elixir, ["${RELEASE_ROOT_DIR}/etc/config.exs"]}
  ]
  set overlays: [
    {:copy, "rel/config/config.exs", "etc/config.exs"}
  ]
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"XZ`At*k1F8IbYK3:D%wEoO>WMgyouR|JVaY{jMjXeF0<Z{MM0*CPl&@LhU^?mIug"
  set vm_args: "rel/vm.args"
  set config_providers: [
    {Distillery.Releases.Config.Providers.Elixir, ["${RELEASE_ROOT_DIR}/etc/config.exs"]}
  ]
  set overlays: [
    {:copy, "rel/config/config.exs", "etc/config.exs"}
  ]
end

release :gramfelbot do
  set version: current_version(:gramfelbot)
  set applications: [
    :runtime_tools
  ]
end

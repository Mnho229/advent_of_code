import Config

config :advent_of_code_utils,
  session: System.get_env("SESSION_COOKIE"),
  auto_compile?: true,
  time_calls?: true,
  gen_tests?: true

config :iex,
  inspect: [charlists: :as_lists]

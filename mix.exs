defmodule GCloud.SpeechAPI.MixProject do
  use Mix.Project

  @version "0.4.0"
  @github_url "https://github.com/SoftwareMansion/elixir-gcloud-speech-grpc"

  def project do
    [
      app: :gcloud_speech_grpc,
      version: @version,
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # hex
      description: "Elixir client for Google Cloud Speech-to-Text API using gRPC",
      package: package(),

      # docs
      name: "Google Cloud Speech gRPC API",
      source_url: @github_url,
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:goth, "~> 1.2"},
      {:protobuf, "~> 0.6"},
      {:grpc, "~> 0.3"},
      {:certifi, "~> 2.6"}
    ]
  end

  defp package do
    [
      maintainers: ["Bartosz Błaszków"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => @github_url
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}",
      groups_for_modules: [
        "Auto-generated": [
          ~r/Google\.Cloud\.Speech.V1\..*/,
          ~r/Google\.Longrunning..*/,
          ~r/Google\.Protobuf\..*/,
          ~r/Google\.Rpc\..*/
        ]
      ],
      nest_modules_by_prefix: [
        GCloud.SpeechAPI,
        Google.Cloud.Speech.V1,
        Google.Longrunning,
        Google.Protobuf,
        Google.Rpc
      ]
    ]
  end
end

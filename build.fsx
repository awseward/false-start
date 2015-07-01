#r @"packages/FAKE/tools/FakeLib.dll"

open Fake

RestorePackages()

Target "Hello" <| fun _ ->
  environVarOrDefault "USERNAME" "world"
    |> tracefn "Hello, %s!"


RunTargetOrDefault "Hello"

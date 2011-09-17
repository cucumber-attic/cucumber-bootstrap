== What

Cucumber bootstrap aims to alleviate the chicken and egg problem with
getting new versions of Cucumber up and running. Once its tests are
passing, implementors can stop using the bootstrap and start executing
the real Cucumber features (see links below) as development continues.

== How

We use a mature version of Cucumber and Aruba to drive a simple command
line application supplied by the implementor and then perform golden
master verification on the output of the CLI app. This is *not* an ideal
approach for the full lifecycle of application development. When the
bootstrap has been performed, implementors *should* switch to using the
features in the Cucumber features repository (see the links below), and
stop running the bootstrap features altogether. That being said, this
kind of testing is very useful to get started.

== Prerequisites

The major prerequisite to getting started is the ability to parse
Gherkin-formatted features. The Gherkin project currently provides
parsers for Ruby, Javascript, Java and C# (via IKVM). If your target
langauge is not supported, please say so on the ML, because there may be
other alternatives, including supporting a foreign language via the wire
protocol or adding support for another language in Gherkin.

Other than that, all you need to do is get Cucumber running with Aruba,
define the step used in the features to execute the temporary CLI
application, and then begin executing the bootstrap scenarios.

== Links

* [Cucumber features](https://github.com/cucumber/cucumber-features)
* [Cucumber ML](https://groups.google.com/forum/#!forum/cukes)

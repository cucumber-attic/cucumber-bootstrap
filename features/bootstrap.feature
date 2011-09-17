Feature: Bootstrap a Cucumber implementation

  Followed in order, these scenarios will help you bootstrap a
  new Cucumber implementation using Cucumber itself and Aruba.

  To get started you will need a minimal command-line executable
  on your path named "cucino" (a variety of baby cucumber) that
  reads the contents of a feature file passed as its first argument.
  From that point on the scenarios should guide you on your way.
  When you are able to begin executing the other feature files,
  please throw "cucino" away. Your real executable should be named
  appropriately. TODO: Define appropriately, e.g. (cucumber.js,
  cucumber-maven-summon-cthulhu).

  TODO: What is the proper extent of the bootstrap feature? Just
  the basics, or scenarios that, building upon each other, yield
  an implementation capable of executing more or less the entirety
  of the happy path through the full-blown features?

  TODO: If we continue in this direction, it would be pretty cool
  to provide a Cucumber.yml with the correct combination of tags
  corresponding to good steps to take through the feature.

  @parsing
  Scenario: Parsing Feature, Scenario and Steps
    Given a file named "cucino.feature" with:
      """
      Feature: Calculator
        Scenario: Addition
          Given a calculator
          When 4 and 5 are added together
          Then the result is 9

      """
    When I successfully run `cucino cucino.feature`
    Then the output should contain:
      """
      Parsed: Features - 1, Scenarios - 1, Steps - 3

      """

  @parsing @multiple
  Scenario: Parsing Feature, Scenario and Steps
    Given a file named "cucino.feature" with:
      """
      Feature: Calculator
        Scenario: Addition
          Given a calculator
          When 4 and 5 are added together
          Then the result is 9

        Scenario: Multiplication
          Given a calculator
          When 3 and 8 are multiplied
          Then the result is 24

      """
    When I successfully run `cucino cucino.feature`
    Then the output should contain:
      """
      Parsed: Features - 2, Scenarios - 2, Steps - 6

      """

  @execution
  Scenario: Executing a single Scenario
    Given a file named "cucino.feature" with:
      """
      Feature: Calculator
        Scenario: Addition
          Given a calculator
          When 4 and 5 are added together
          Then the result is 9

      """
    When I successfully run `cucino cucino.feature`
    Then the output should contain:
      """
      Results: ...
      """

  @execution @multiple
  Scenario: Executing multiple Scenarios
     Given a file named "cucino.feature" with:
      """
      Feature: Calculator
        Scenario: Addition
          Given a calculator
          When 4 and 5 are added together
          Then the result is 9

        Scenario: Multiplication
          Given a calculator
          When 3 and 8 are multiplied
          Then the result is 24

      """
    When I successfully run `cucino cucino.feature`
    Then the output should contain:
      """
      Results: ......
      """

  @doc_string
  Scenario: Parsing a Step with DocString argument
    Given a file named "cucino.feature" with:
      """
      Feature: Calculator
        Scenario: Add a list
          Given a calculator
          When this list of numbers is added up:
            \"\"\"
            1
            2
            3
            \"\"\"
          Then the result is 6

      """
    When I successfully run `cucino.feature`
    Then the output should contain:
      """
      Parsed: Features - 1, Scenarios - 1, Steps - 3
      Results: ...
      """

  @table
  Scenario: Parsing a Step with Table argument
    Given a file named "cucino.feature" with:
      """
      Feature: Calculator
        Scenario: Add a list
          Given a calculator
          When these operations are performed:
            | add      | 2  |
            | multiply | 6  |
          Then the result is 12

      """
    When I successfully run `cucino.feature`
    Then the output should contain:
      """
      Parsed: Features - 1, Scenarios - 1, Steps - 3
      Results: ...
      """

  @background
  Scenario: Support Background
    Given a file named "cucino.feature" with:
      """
      Feature: Calculator
        Background:
          Given a calculator

        Scenario: Addition
          When 4 and 5 are added together
          Then the result is 9

        Scenario: Multiplication
          When 2 and 6 are multiplied
          Then the result is 12

      """
    When I successfully run `cucino.feature`
    Then the output should contain:
      """
      Parsed: Features - 1, Scenarios - 2, Steps - 6
      Results: ......
      """

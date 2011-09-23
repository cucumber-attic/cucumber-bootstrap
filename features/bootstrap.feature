Feature: Bootstrap a Cucumber implementation

  To get started you will need a minimal command-line executable
  on your path named "cucino" (a variety of baby cucumber) that
  reads the contents of a feature file passed as its first argument.

  From that point on the scenarios should guide you on your way.
  When you are able to begin executing the real feature files from
  the cucumber-features project, please throw "cucino" away. 

  Scenario: Compiling Feature, Scenario and Steps
    Given a file named "single.feature" with:
      """
      Feature: Calculator
        Scenario: Addition
          Given a calculator
          When 4 and 5 are added together
          Then the result is 9

      """
    When I successfully run `cucino single.feature`
    Then the output should contain:
      """
      Results: Scenarios - 1, Steps - 3

      """

  Scenario: Compiling a Feature with multiple Scenarios
    Given a file named "multiple.feature" with:
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
    When I successfully run `cucino multiple.feature`
    Then the output should contain:
      """
      Results: Scenarios - 2, Steps - 6

      """

  Scenario: Compiling Background
    Given a file named "background.feature" with:
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
    When I successfully run `cucino background.feature`
    Then the output should contain:
      """
      Results: Scenarios - 2, Steps - 6

      """

  Scenario: Step with a DocString argument
    Given a file named "doc_string.feature" with:
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
    When I successfully run `cucino doc_string.feature`
    Then the output should contain:
      """
      Results: Scenarios - 1, Steps - 3

      """

  Scenario: Step with DataTable argument
    Given a file named "data_table.feature" with:
      """
      Feature: Calculator
        Scenario: Add a list
          Given a calculator
          When these operations are performed:
            | add      | 2  |
            | multiply | 6  |
          Then the result is 12

      """
    When I successfully run `cucino data_table.feature`
    Then the output should contain:
      """
      Results: Scenarios - 1, Steps - 3

      """

  Scenario: Execution
    Given a file named "execution.feature" with:
      """
      Feature: Calculator
        Background:
          Given a calculator

      Scenario: Sum a list
        When these numbers are summed together:
          \"\"\"
          1
          2
          3
          \"\"\"
        Then the result is 6

      Scenario: Multiply a table incorrectly
        When these numbers are multiplied:
          | 2 |
          | 4 |
          | 6 |
        Then the result is 42

      """
    When I successfully run `cucino execution.feature`
    Then the output should contain:
      """
      Results: Scenarios - 2, Steps - 6
      Sum a list: passed
      Multiply a table: failed

      """


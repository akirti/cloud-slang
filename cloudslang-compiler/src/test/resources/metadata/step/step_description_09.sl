namespace: io.cloudslang.rocks

flow:
    name: step_description_09

    inputs:
      - input_1: ""
      - input_2: ""

    workflow:
      #!!
      #! @input step_input_1: description step input 1
      #! @input step_input_2: description step input 2 line 1
      #!                        description step input 2 line 2
      #! @input step_input_3:
      #!!#
      - step_1:
          do:
            operation_name:
              - step_input_1: ${input_1}
              - step_input_2: ${input_2}
          publish:
            - step_output_1
            - step_output_2
          navigate:
            - SUCCESS: step_2
            - FAILURE: FAILURE

      - step_2:
          do:
            operation_name:
              - step_input_1: ${input_1}
              - step_input_2: ${input_2}
          publish:
            - step_output_1
            - step_output_2
          navigate:
            - SUCCESS: step_3
            - FAILURE: FAILURE

      #!!
      #!         @input step_input_1: description step input 1 line 1
      #!                      description step input 1 line 2
      #!                      description step input 1 line 3
      #!
      #!         description step input 1 line 4
      #!                      `abc`65756756765753545^&&&&###@21321
      #!     @input step_input_4: description step input 4 line 1
      #!
      #! @output step_output_1 :                      description step output 1
      #! @output step_output_2: description step output 2 line 1
      #!                        description step output 2 line 2
      #!!#
      ##########################################################################################
      - step_3:
          do:
            operation_name:
              - step_input_1: ${input_1}
              - step_input_4: ${input_2}
          publish:
            - step_output_1
            - step_output_2
          navigate:
            - SUCCESS: step_4
            - FAILURE: FAILURE

      #!!
      #! @output step_output_1 :                      description step output 1
      #! @output step_output_2: description step output 2 line 1
      #!                        description step output 2 line 2
      #! @step_invalid_tag: content
      #!!#
      - step_4:
          do:
            operation_name:
              - step_input_1: ${input_1}
              - step_input_4: ${input_2}
          publish:
            - step_output_1
            - step_output_2
          navigate:
            - SUCCESS: step_5
            - FAILURE: FAILURE

      #!!
      #!!#
      - step_5:
          do:
            operation_name:
              - step_input_1: ${input_1}
              - step_input_4: ${input_2}
          publish:
            - step_output_1
            - step_output_2
          navigate:
            - SUCCESS: step_6
            - FAILURE: FAILURE

      #!!
      #!
      #!!#
      - step_6:
          do:
            operation_name:
              - step_input_1: ${input_1}
              - step_input_4: ${input_2}
          publish:
            - step_output_1
            - step_output_2
          navigate:
            - SUCCESS: SUCCESS
            - FAILURE: FAILURE
    outputs:
      - output_1: ${step_output_1}

    results:
      - SUCCESS
      - FAILURE
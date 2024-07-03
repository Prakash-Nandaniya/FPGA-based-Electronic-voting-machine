# PUNQZ2 and Raspberry Pi Based Electronic Voting Machine

This project is a digital design project for an electronic voting machine using Verilog code. The system is implemented on a PUNQZ2 board and a RPI module. The voting machine is designed for 2 candidates, with an extendable limit based on hardware availability. The project supports a maximum of 16 votes per candidate due to the 4-bit design, but this limit can be increased. The machine operates in two states: voting state and result state.

## Features
- **Two Candidates**: Supports voting for two candidates, extendable to more candidates.
- **Voting Limit**: Each candidate can receive up to 16 votes (4-bit limit).
- **Voting State**: Allows users to cast votes. Red LED glows to indicate this state.
- **Result State**: Displays the results of the voting in 8-bit format. Blue LED glows to indicate this state.
- **Reset Functionality**: A reset button to reset all votes to 0.
- **State Control**: Voting is disabled during the result state.

## Hardware Requirements
- PUNQZ2 FPGA Board
- RPI module
- Red and Blue LEDs
- Buttons for voting and reset
- Display for showing results

## Verilog Code Overview
The Verilog code is responsible for handling the voting logic, state transitions, and display control.

### Voting State
- In this state, the red LED is turned on.
- Votes can be cast for either of the two candidates.
- Votes are counted and stored in 4-bit registers.

### Result State
- In this state, the blue LED is turned on.
- Voting is disabled.
- The results are displayed in 8-bit format.

## Extending the System
- The system can be extended to support more candidates by increasing the number of buttons and adjusting the Verilog code accordingly.
- The voting limit can be increased by changing the bit-width of the vote counters.

## Project Files
- `voting_machine.v`: Main Verilog code for the voting machine.
- `top_module.v`: Top module integrating the voting logic with the hardware components.
- `constraints.xdc`: Constraints file for the PUNQZ2 board.

## Authors
- Prakash Nandaniya


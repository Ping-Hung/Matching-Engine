# Matching-Engine
A simple matching engine that I intended to build while learning C++ development

# Requirements
- CMake ≥ Version 3.16
- A C++ compiler (I use GNU g++)
- `Ubuntu-22.04` and `python3`

# Build Instructions
- Depending on use case, see [run.sh](run.sh) or run `./run.sh --help` for details

# Design Requirements and Choices
## Order Book
- Organize and display all buy and sell orders for an asset in real-time
### Bid
- Track all buying orders 
- Organize all buying orders from highest to lowest
### Ask
- Track all selling orders 
- Organize all selling orders from lowest to highest

## Matching Algorithm
### FIFO
- Prioritize orders by 1. best price and 2. order timing (if 2 orders have the same price, the one arrived
  earliest gets executed).

# Resources
1. https://quadcode.com/blog/matching-engine-what-is-it-and-how-does-it-work

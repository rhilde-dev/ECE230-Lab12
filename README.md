# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
- The Modulo Counter divides by 2 * Count as the output bit is most of the time taken from the MSB of the counter, where
the MSB will stay low for half of the counting range, and high for the other half. 

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
- The ring counter outputs all 1s on the first clock to correct an invalid startup state as all 0's Forcing all 1s ensures the next clock produces a valid one-hot pattern, allowing the ring counter to operate properly.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
- The width of the ring counter to use to get an output of ~1KHz would be......


% guessing game
num= randi([1,300]); % choosing number
n=8;                 % initializing guess number variable
disp('I''m thinking of an integer between 1 and 300');

while n>0 % loop while user has guesses left
    prompt= sprintf('Guess the number (%d guesses left) : ',n); % set prompt with guess variable
    guess= input(prompt);
    if guess>num % comparing guess to real value
        disp('Your guess was too high');
    elseif guess<num
        disp('Your guess was too low');
    else
        disp('Congratulations!');
    end
    n=n-1; %removing one guess
end

disp('Try again next time') % game over

% I think you need 8 guesses to absolutely guarantee success. You can split
% the interval in half every time and narrow it down to one possible
% solution by the 8th guess.
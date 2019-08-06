% computer guessing your number
disp('Think of your number between 1 and 300.');
guessVal= 150; attempt= 8; low= 1; high= 300; % initiating variables

while attempt>0 % loop while the computer still has tries remaining
    prompt= sprintf('Is %d too high, too low, or correct? (%d guesses left): ',guessVal,attempt);
    userResponse= input(prompt,'s');   % sets up guess format and response input
    % adjusting guess value and parameters based on feedback
    if userResponse=='L'
        low= guessVal+1; % sets new parameter
        guessVal= floor((low+high)/2); % sets new guess as middle of new range
    elseif userResponse=='H'
        high= guessVal-1; % sets new parameter
        guessVal= floor((low+high)/2); % sets new guess as middle of new range
    else
        disp('Guessed it.'); % computer correctly guessed
    end
    
    attempt=attempt-1; %removes an attempt for each wrong guess
end

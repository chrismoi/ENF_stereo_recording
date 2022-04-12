%%
% 2 channel stereo recording from 'Line in' input source @1 Khz, 16-bit
% CH1: photodiode signal, CH2: ENF power mains
recObj = audiorecorder(1000,16,2,2); %

disp('Recording...')

formatOut = 'yyyy/mm/dd HH:MM:SS.FFF';
% start of recording timestamp
timestamp = datestr(now,formatOut)

% 12 minute recording (720 secs)
recordblocking(recObj, 720);
disp('End of Recording.');
disp('Writing .wav file');

% Write audio data to a .wav file
myRecording = getaudiodata(recObj);
audiowrite('2CH_recording.wav',myRecording,1);

disp('Done');
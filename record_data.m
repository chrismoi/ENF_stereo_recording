info = audiodevinfo
info.input(3)
%nDevices = audiodevinfo(IO)
% ID = audiodevinfo(IO,'Microphone (Realtek(R) Audio)')
recObj = audiorecorder(1000,16,2,2); % ch1: mains, ch2: photodiode

disp('Start of recording')
formatOut = 'yyyy/mm/dd HH:MM:SS.FFF';
timestamp = datestr(now,formatOut)
%dlmwrite('myEnf.csv',timestamp)
fid = fopen(strcat('ENF_2CH_',datestr(now,'dd_mm_yyyy'),'.csv'), 'wt');
% fprintf(fid,'%c',timestamp);
% fclose(fid);

recordblocking(recObj, 720); % 18000, 5-hour recording
disp('End of Recording.');

%play(recObj);

myRecording = getaudiodata(recObj);

disp('Writing .wav file');
audiowrite('ENF_2CH.wav',myRecording,1);
disp('Done');
disp('Writing .csv file');
dlmwrite(strcat('ENF_2CH_',datestr(now,'dd_mm_yyyy'),'.csv'),myRecording,'-append');
disp('Done');
fclose(fid);

plot(myRecording);
axis([0 5000 -0.5 0.5])
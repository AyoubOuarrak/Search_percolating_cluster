function res = Benchmark() 
  index  = 1;
  for N = 10 : 20 : 1000
    for attempts = 1 : 5
      tic, Cluster_finding_HK(N, 0.5);   timeHK(attempts) = toc;
      tic, cluster_finding(N, 0.5); timeLabel(attempts) = toc;
    end 
    timeHKerr(index) = mean(timeHK);
    timeLabelErr(index) = mean(timeLabel);
    
    errHK(index) = std(timeHK) / (sqrt(length(timeHK)));
    errLabel(index) = std(timeLabel) / (sqrt(length(timeLabel)));
    index
    index = index + 1;
  end
  L = 10 : 20 : 1000;
  errorbar(L, timeLabelErr, errLabel, 'blue');
  hold on
  errorbar(L, timeHKerr, errHK, 'red'); 
end

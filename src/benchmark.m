function res = benchmark()
    time1 = [];
    time2 = [];
    avgT1 = [];
    avgT2 = [];
    x = [];
    for p = 0.1 : 0.05 : 1
        for N = 50 : 25 : 200
            
            %first algorithm
            tic;
            cluster_finding(N, p);
            time1 = [time1 toc];
            
            %second algorithm
            tic;
            HK_algorithm(N, p);
            time2 = [time2 toc];
        end
        avgT1 = [avgT1 mean(time1)];
        avgT2 = [avgT2 mean(time2)];
         x = [x (p)];
         time1 = [];
         time2 = [];
    end
    plot(x, avgT1, x, avgT2);
    title('Benchmark');
    xlabel('Probability');
    legend('Labeling algorithm', 'HK algorithm');
end
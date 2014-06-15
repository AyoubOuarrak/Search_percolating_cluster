function res = critical_threshold(attempts)
    % N : order of matrix
    percolation = zeros(1, attempts);
    percolations = [];
    avgPercolations = [];
    AVGpercolation = [];
    AVGpercolation1 = [];
    AVGpercolation2 = [];
    AVGpercolation3 = [];
    x = [];
    xx = [];
    err = [];
    
    for p = 0.3 : 0.01 : 1
        for j = 1 :  attempts
            percolation(j) = cluster_finding(10, p);
        end
        AVGpercolation = [AVGpercolation (mean(percolation))];
        percolation =zeros(1, attempts) ;
        x = [x (p)];
        
        for j = 1 :  attempts
            percolation(j) = cluster_finding(50, p);
        end
        AVGpercolation1 = [AVGpercolation1 (mean(percolation))];
        percolation =zeros(1, attempts) ;
        
         for j = 1 :  attempts
            percolation(j) = cluster_finding(100, p);
        end
        AVGpercolation2 = [AVGpercolation2 (mean(percolation))];
        percolation =zeros(1, attempts) ;
        
         for j = 1 :  attempts
            percolation(j) = cluster_finding(200, p);
        end
        AVGpercolation3 = [AVGpercolation3 (mean(percolation))];
        percolation =zeros(1, attempts) ;
    end
    plot(x, AVGpercolation, x, AVGpercolation1, x, AVGpercolation2, x, AVGpercolation3);
    title('Critical threshold');
    xlabel('Probability');
    legend('L = 10', 'L = 50', 'L = 100', 'L = 200');
end
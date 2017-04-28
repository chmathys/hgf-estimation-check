function plot_kas(kas)
    %% Dimensions 
    [M, N] = size(kas)

    %% Traverse array
    for m = 1:M
        for n = 1:N
            subplot(M, N, (m-1)*N+n)
            boxplot(kas{M+1-m,n}, 'Symbol', '')
            ylim([0 15])
            xticks([])
        end
    end
end

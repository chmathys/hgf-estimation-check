function gather_kas(topdir)
    %% Zeta levels
    zetas = {'0.5' '1' '6' '24'};
    kappas = {'0.5' '1' '1.5' '2' '2.5' '3' '3.5'};

    %% Initialize kas cell array
    kas = cell(7,4);

    %% Traverse directory tree
    cd(topdir);
    for z = 1:length(zetas)
        cd(zetas{z});
        for k = 1:length(kappas)
            cd(kappas{k});
            kas(k,z) = {load('kas')};
            cd ..
        end
        cd ..
    end
    cd ..

    save('kas.mat', 'kas');
end

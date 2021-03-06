function [version, hash] = tapas_version(verbose)
%% Print and returns the release version of the code.
%
%   Input
%       verbose     -- If true prints the instructions to cite different 
%                      parts of the toolbox. Defaults to false.
%       
%   Output
%       version     -- Current version of tapas
%       hash        -- If possible return the hash of the git repository.
%

% aponteeduardo@gmail.com
% copyright (C) 2017
%

version = {2, 5, 0, 0};
hash = ''; % In a future implementation

if nargin < 1
    verbose = 0;
end

if verbose
    tapas_print_logo();
    fprintf(1, '\n\nVersion %d.%d.%d.%d\n', version{:});
    fprintf(1, 'In your citation please include the current version.\n');
    fprintf(1, 'Please cite the corresponding masucript according to:\n')
    fprintf(1, 'Physio: https://www.ncbi.nlm.nih.gov/pubmed/27832957\n')
    fprintf(1, 'HGF:    https://www.ncbi.nlm.nih.gov/pubmed/21629826\n')
    fprintf(1, '        https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4237059\n');
    fprintf(1, 'MPDCM:  https://www.ncbi.nlm.nih.gov/pubmed/26384541\n');
    fprintf(1, 'SERIA:  doi: https://doi.org/10.1101/109090\n');
end

end


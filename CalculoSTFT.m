function CalculoSTFT(nDigitos,repDigito)
    stftData = cell(nDigitos, 1);
    
    for num = 0:nDigitos-1
        digitData = cell(repDigito, 1); % Inicializar célula para armazenar as STFTs das amostras
        
        % Calcular as STFTs de cada amostra
        for i = 0:repDigito-1
            filename = sprintf('%d_36_%d.wav', num, i);
            fprintf("%s\n", filename);
            [audio, fs] = audioread(filename);
            
            % Definir os parâmetros da STFT
            windowSize = 0.02 * fs; % tamanho da janela em segundos
            overlap = round(windowSize / 2); % tamanho do overlap em amostras
            nfft = 2^nextpow2(windowSize); % tamanho da FFT
            
            % Calcular a STFT
            [S, F, T] = spectrogram(audio, windowSize, overlap, nfft, fs);
            
            digitData{i+1} = abs(S); % Armazenar STFT da amostra atual
        end
        
        % Encontrar o tamanho máximo das STFTs
        maxSize = [0 0];
        for i = 0:repDigito-1
            sizeS = size(digitData{i+1});
            maxSize = max(maxSize, sizeS(1:2));
        end
        
        % Ajustar o tamanho das STFTs para corresponder ao tamanho máximo
        for i = 0:repDigito-1
            sizeS = size(digitData{i+1});
            padding = maxSize - sizeS(1:2);
            digitData{i+1} = padarray(digitData{i+1}, padding, 0, 'post');
        end
        
        digitDataMean = mean(cat(3, digitData{:}), 3); % Média das STFTs das amostras
        
        stftData{nDigitos+1} = digitDataMean;
        
        % Plot o espectrograma médio
        figure;
        imagesc(T*1000, F/1000, abs(digitDataMean)); 
        axis xy;
        colormap(jet);
        xlabel('Tempo (ms)');
        ylabel('Frequência (kHz)'); 
        colorbar;
        title(sprintf('%d', num));
    end
    
    save('stftData.mat', 'stftData'); % Salvar dados em um arquivo .mat
end




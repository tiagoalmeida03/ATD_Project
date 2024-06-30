function plotAudio(nDigitos,repDigito)
    energias = zeros(2, 11);
    amplitudes_maximas = zeros(2, 11);
    medias = zeros(2, 11);
    potencias = zeros(2, 11);

    for num = 0:nDigitos-1
        for i = 0:repDigito-1
            filename = sprintf('%d_36_%d.wav', num, i);
            fprintf("%s\n", filename);
            [audio, fs] = audioread(filename);

            figure;
            t = length(audio) / fs; % tempo total do sinal
            tempo = linspace(0, t, length(audio)); % vetor de tempo em segundos
            plot(tempo, audio);
            xlabel('Time (s)');
            ylabel('Amp.');
            title(sprintf('Digito: %d Som: %d', num, i));

            % Calcular a energia, a amplitude máxima e a média do sinal de áudio
            energia = sum(audio.^2);
            amplitude_maxima = max(abs(audio));
            media = mean(audio);
            potencia = mean(audio.^2);

            fprintf('Energia do sinal: %f\n', energia);
            fprintf('Amplitude máxima do sinal: %f\n', amplitude_maxima);
            fprintf('Média do sinal: %f\n', media);
            fprintf('Potencia do sinal: %f\n', potencia);

            energias(num + 1, i + 1) = energia;
            amplitudes_maximas(num + 1, i + 1) = amplitude_maxima;
            medias(num + 1, i + 1) = media;
            potencias(num + 1, i + 1) = potencia;

            
        end
    end
    
    save('audioData.mat', 'energias', 'amplitudes_maximas', 'medias', 'potencias'); % Salvar dados em um arquivo .mat
end


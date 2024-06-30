function CalculoDFT(nDigitos, repDigito)
    espect0 = [];
    espect1 = [];
    espect2 = [];
    espect3 = [];
    espect4 = [];
    espect5 = [];
    espect6 = [];
    espect7 = [];
    espect8 = [];
    espect9 = [];
    fmax_digito = zeros(nDigitos, repDigito);
    spectral_digito = zeros(nDigitos, repDigito);
    fmin_digito = zeros(nDigitos, repDigito);
    
    for num = 0:nDigitos-1
        for i = 0:repDigito-1
            filename = sprintf('%d_36_%d.wav', num, i);
            fprintf("%s\n", filename)
            [audio, fs] = audioread(filename);

            N = numel(audio);
            dN = 48000 - N - 1;
            audio = [audio; zeros(dN, 1)];
            N = numel(audio);

            X = abs(fftshift(fft(audio .* hamming(N)))) ./ N;
            t = (0:N-1) * (1/fs);
            f = (-fs/2:fs/(N-1):fs/2);
            ix = find(f >= 0);
            Xf = X(ix);
            fp = f(ix);

            % Armazenar todos os espectros de amplitude para cada digito
            if num == 0
                espect0 = [espect0, Xf];
            elseif num == 1
                espect1 = [espect1, Xf];
            elseif num == 2
                espect2 = [espect2, Xf];
            elseif num == 3
                espect3 = [espect3, Xf];
            elseif num == 4
                espect4 = [espect4, Xf];
            elseif num == 5
                espect5 = [espect5, Xf];
            elseif num == 6
                espect6 = [espect6, Xf];
            elseif num == 7
                espect7 = [espect7, Xf];
            elseif num == 8
                espect8 = [espect8, Xf];
            elseif num == 9
                espect9 = [espect9, Xf];   
            end

            % Calcular a frequência máxima
            [fmax, idx] = max(X);
            fmax = (idx - 1) * fs / N;
            
            % Armazenar a frequência máxima do dígito atual
            fmax_digito(num+1, i+1) = fmax;
            
            % Calcular a frequência mínima
            [fmin, idx] = min(X);
            fmin = (idx - 1) * fs / N;

            % Armazenar a frequência mínima do dígito atual
            fmin_digito(num+1, i+1) = fmin;

            % Calcular a spectral edge
            cumsumX = cumsum(X);
            spectraledge = find(cumsumX >= 0.95 * cumsumX(end), 1);
            spectraledge = (spectraledge - 1) * fs / N;
            
            spectral_digito(num+1, i+1) = spectraledge;

            % Mostrar os resultados
            disp(['Frequência máxima: ', num2str(fmax), ' Hz']);
            disp(['Spectral edge: ', num2str(spectraledge), ' Hz']);
            disp(['Frequência mínima: ', num2str(fmin), ' Hz']);
        end
    end
    
    % Criar a estrutura para armazenar os espectros e outros dados
    espectros = struct('espect0', espect0, 'espect1', espect1, 'espect2', espect2, 'espect3', espect3, 'espect4', espect4, 'espect5', espect5, 'espect6', espect6, 'espect7', espect7, 'espect8', espect8, 'espect9', espect9);
    
    % Adicionar fp e ix à estrutura
    espectros.fp = fp;
    espectros.ix = ix;
    espectros.f = f;
    
    % Plotar o gráfico das frequências máximas
    figure;
    for num = 0:nDigitos-1
        plot(0:repDigito-1, fmax_digito(num+1, :), 'o-');
        hold on;
    end
    hold off;
    
    xlabel('Amostras');
    ylabel('Frequência Máxima (Hz)');
    title('Frequência Máxima para Cada Dígito');
    legend('Dígito 0', 'Dígito 1', 'Dígito 2', 'Dígito 3', 'Dígito 4', 'Dígito5', 'Dígito 6', 'Dígito 7', 'Dígito 8', 'Dígito 9');
    
     % Plotar o gráfico do spectraledge 
    figure;
    for num = 0:nDigitos-1
        plot(0:repDigito-1, spectral_digito(num+1, :), 'o-');
        hold on;
    end
    hold off;
    
    xlabel('Amostras');
    ylabel('Spectraledge (Hz)');
    title('Spectraledge para Cada Dígito');
    legend('Dígito 0', 'Dígito 1', 'Dígito 2', 'Dígito 3', 'Dígito 4', 'Dígito5', 'Dígito 6', 'Dígito 7', 'Dígito 8', 'Dígito 9');
    
    % Plotar o gráfico da frequencias minimas
    figure;
    for num = 0:nDigitos-1
        plot(0:repDigito-1, fmin_digito(num+1, :), 'o-');
        hold on;
    end
    hold off;
    
    xlabel('Amostras');
    ylabel('Frequência Miníma (Hz)');
    title('Frequência Miníma para Cada Dígito');
    legend('Dígito 0', 'Dígito 1', 'Dígito 2', 'Dígito 3', 'Dígito 4', 'Dígito5', 'Dígito 6', 'Dígito 7', 'Dígito 8', 'Dígito 9');
    
    % Salvar a estrutura em um arquivo .mat
    save('dftData.mat', 'espectros');
end

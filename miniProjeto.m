%% Exercicio 4
nDigitos = 10;
repDigito = 50;

plotAudio(nDigitos,repDigito);

load('audioData.mat');
%% Gráficos para comparar sinais

figure;
clf;
colors_energias = {'k', 'g', 'r', 'b', 'c', 'm', 'y', [0.4940 0.1840 0.5560], [0.4660 0.6740 0.1880], [0.6350 0.0780 0.1840]};

% Plot dos pontos de energia e amplitudes
for i = 1:10
    scatter(energias(i,:), amplitudes_maximas(i,:), [], colors_energias{i});
    hold on;
end

title('Energias e Amplitudes Máximas dos Dígitos');
xlabel('Energia');
ylabel('Amplitude Máxima');

% Adicione a legenda
legend('Audio 0', 'Audio 1', 'Audio 2', 'Audio 3', 'Audio 4', 'Audio 5', 'Audio 6', 'Audio 7', 'Audio 8', 'Audio 9');

%%
figure(4);

clf

plot(potencias(1,: ),'ko');
hold on;
plot(potencias(2,: ), 'g*');
hold on;
plot(potencias(3,: ), 'r+');
hold on;
plot(potencias(4,: ), 'b^');
hold on;
plot(potencias(5,: ), 'cp');
hold on;
plot(potencias(6,: ), 'ms');
hold on;
plot(potencias(7,: ), 'ydiamond');
hold on;
plot(potencias(8,: ),'*','Color',[0.4940 0.1840 0.5560]);
hold on;
plot(potencias(9,: ),'^','Color',[0.4660 0.6740 0.1880]);
hold on;
plot(potencias(10,: ),'s','Color',[0.6350 0.0780 0.1840]);


legend(sprintf('Audio 0'), sprintf('Audio 1'), sprintf('Audio 2'), sprintf('Audio 3'), sprintf('Audio 4'), sprintf('Audio 5'), sprintf('Audio 6'), sprintf('Audio 7'), sprintf('Audio 8'), sprintf('Audio 9'));

title('Potência dos Dígitos');
xlabel('Amostras');
ylabel('Potência');
%% Gráficos para comparar sinais

figure(4);

clf

plot(medias(1,: ),'ko');
hold on;
plot(medias(2,: ), 'g*');
hold on;
plot(medias(3,: ), 'r+');
hold on;
plot(medias(4,: ), 'b^');
hold on;
plot(medias(5,: ), 'cp');
hold on;
plot(medias(6,: ), 'ms');
hold on;
plot(medias(7,: ), 'ydiamond');
hold on;
plot(medias(8,: ),'*','Color',[0.4940 0.1840 0.5560]);
hold on;
plot(medias(9,: ),'^','Color',[0.4660 0.6740 0.1880]);
hold on;
plot(medias(10,: ),'s','Color',[0.6350 0.0780 0.1840]);

legend(sprintf('Audio 0'), sprintf('Audio 1'), sprintf('Audio 2'), sprintf('Audio 3'), sprintf('Audio 4'), sprintf('Audio 5'), sprintf('Audio 6'), sprintf('Audio 7'), sprintf('Audio 8'), sprintf('Audio 9'));

title('Média dos Dígitos');
xlabel('Amostras');
ylabel('Média');
%% Gráficos para comparar sinais

figure(4);

clf

plot(energias(1,: ),'ko');
hold on;
plot(energias(2,: ), 'g*');
hold on;
plot(energias(3,: ), 'r+');
hold on;
plot(energias(4,: ), 'b^');
hold on;
plot(energias(5,: ), 'cp');
hold on;
plot(energias(6,: ), 'ms');
hold on;
plot(energias(7,: ), 'ydiamond');
hold on;
plot(energias(8,: ),'*','Color',[0.4940 0.1840 0.5560]);
hold on;
plot(energias(9,: ),'^','Color',[0.4660 0.6740 0.1880]);
hold on;
plot(energias(10,: ),'s','Color',[0.6350 0.0780 0.1840]);

legend(sprintf('Audio 0'), sprintf('Audio 1'), sprintf('Audio 2'), sprintf('Audio 3'), sprintf('Audio 4'), sprintf('Audio 5'), sprintf('Audio 6'), sprintf('Audio 7'), sprintf('Audio 8'), sprintf('Audio 9'));

title('Energia dos Dígitos');
xlabel('Amostras');
ylabel('Energia');
%% Gráficos para comparar sinais

figure(4);

clf

plot(amplitudes_maximas(1,: ),'ko');
hold on;
plot(amplitudes_maximas(2,: ), 'g*');
hold on;
plot(amplitudes_maximas(3,: ), 'r+');
hold on;
plot(amplitudes_maximas(4,: ), 'b^');
hold on;
plot(amplitudes_maximas(5,: ), 'cp');
hold on;
plot(amplitudes_maximas(6,: ), 'ms');
hold on;
plot(amplitudes_maximas(7,: ), 'ydiamond');
hold on;
plot(amplitudes_maximas(8,: ),'*','Color',[0.4940 0.1840 0.5560]);
hold on;
plot(amplitudes_maximas(9,: ),'^','Color',[0.4660 0.6740 0.1880]);
hold on;
plot(amplitudes_maximas(10,: ),'s','Color',[0.6350 0.0780 0.1840]);

legend(sprintf('Audio 0'), sprintf('Audio 1'), sprintf('Audio 2'), sprintf('Audio 3'), sprintf('Audio 4'), sprintf('Audio 5'), sprintf('Audio 6'), sprintf('Audio 7'), sprintf('Audio 8'), sprintf('Audio 9'));

title('Amplitudes Maximas dos Dígitos');
xlabel('Amostras');
ylabel('amplitude maxima');
%% Gráficos de dispersão 
figure(1);
boxplot(energias');
title(sprintf('Dispersão de Energias'));

figure(2);
boxplot(amplitudes_maximas');
title(sprintf('Dispersão de Amplitudes Maximas'));

figure(3);
boxplot(medias');
title(sprintf('Dispersão de Médias'));

figure(4);
boxplot(potencias');
title(sprintf('Dispersão de Potências'));
%% Calculo Da DFT

CalculoDFT(nDigitos,repDigito);

dados = load('dftData.mat');
fp = dados.espectros.fp;
ix = dados.espectros.ix;
f = dados.espectros.f;
%% Plot da DFT para cada dígito
figure;

subplot(2, 5, 1);
plot(fp, dados.espectros.espect0);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 0');

subplot(2, 5, 2);
plot(fp, dados.espectros.espect1);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 1');

subplot(2, 5, 3);
plot(fp, dados.espectros.espect2);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 2');

subplot(2, 5, 4);
plot(fp, dados.espectros.espect3);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 3');

subplot(2, 5, 5);
plot(fp, dados.espectros.espect4);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 4');

subplot(2, 5, 6);
plot(fp, dados.espectros.espect5);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 5');

subplot(2, 5, 7);
plot(fp, dados.espectros.espect6);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 6');

subplot(2, 5, 8);
plot(fp, dados.espectros.espect7);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 7');

subplot(2, 5, 9);
plot(fp, dados.espectros.espect8);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 8');

subplot(2, 5, 10);
plot(fp, dados.espectros.espect9);
xlabel('Frequência (Hz)');
ylabel('Magnitude');
title('Dígito 9');

%% ======================Calcular e representar o espetro mediano, o 1ºquartil e o 3º quartil =========================
close all
fp = f(ix);
fp = fp./1000; 

for i = 1:10
    median_spectrum = eval(['median(dados.espectros.espect',num2str(i-1),',2);']);
    q1_spectrum = eval(['quantile(dados.espectros.espect',num2str(i-1),',0.25,2);']);
    q3_spectrum = eval(['quantile(dados.espectros.espect',num2str(i-1),',0.75,2);']);
    figure(i);
    if i == 1
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 2
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 3
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 4
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 5
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 6
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 7
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 8
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 9
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    elseif i == 10
        subplot(4,3,2);
        plot(fp,median_spectrum,'linewidth',1);
        hold on
        plot(fp,q1_spectrum, 'k--','linewidth',1);
        plot(fp, q3_spectrum, 'r--', 'linewidth', 1);
        legend('Median', '1º quartil', '3º quartil');
        xticks([2,4,6,8])
        xlim([0 8])
        xlabel('Frequência (kHz)');
        ylabel('IX dft (f)/N');
        title([num2str(i-1)]);
    end      
end

%% Cálculo STFT
CalculoSTFT(nDigitos, repDigito);






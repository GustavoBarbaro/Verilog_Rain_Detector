# Verilog Rain Detector

Este projeto visa utilizar um Kit de desenvolvimento FPGA da Altera em conjunto com um módulo bluetooth e um sensor de detecção de chuva para detectar a presençã de chuva e enivar alertas pelo display LCD do kit de desenvolvimento e para o celular do usuário atravéz do bluetooth



---

# Componentes Utilizados

* Kit Altera DE2-115
* Módulo Bluetooth HC-05
* Sensor de chuva

---

# Get Started

## Descompactar o `.qar`

O arquivo .qar (Quartus Archive File) contém todo o projeto pronto para ser aberto no Quartus Prime. Siga os passos abaixo para descompactar:

1. Abra o Quartus Prime.

2. No menu principal, clique em:

> Project → Restore Archived Project...

3. Selecione o arquivo rain_module_project.qar localizado neste repositório.

4. Escolha um diretório de destino onde o projeto será descompactado.

5. Clique em OK para restaurar o projeto.

Após restaurado, o Quartus criará uma nova pasta com todos os arquivos do projeto prontos para edição e compilação.


## Como Compilar o Projeto

1. Descompacte o projeto pelo aquivo `.qar` ou se preferir acesse a pasta `\rain_module_detector`
2. Defina o arquivo rain_module_project.v como o topo da hierarquia:

    * No menu Project clique em:

> Project → Set as Top-Level Entity

(ou clique com o botão direito no arquivo na aba Project Navigator e selecione Set as Top-Level Entity).

3. Vá em:

> Processing → Start Compilation

4. Aguarde até a compilação ser concluída com sucesso.


---

Para mais informações sobre o projeto consulte a pasta `\Relatorio e Slides`

---

# Bits de Controle

Bits enviados diretamente por meio das chaves a Unidade de Controle, onde cada configuração represente uma função do sistema.


| CH3 | CH2 | CH1 | Função: |
|---|---|---|---|
| 0 | 0 | 0 | Sensor desligado e Bluetooth Off |
| 0 | 0 | 1 | Consulta Valor do Sensor e printa no display |
| 0 | 1 | 0 | Liga módulo Bluetooh |
| 0 | 1 | 1 | Reseta módulo Bluetooth |


---

# Esquemático

![Esquematico](https://github.com/user-attachments/assets/52619ea9-2e22-4f77-80c9-6cf7678f9ac4)


---


# Memória de Mensagens

Baseado na configuração das chaves mencionado em Bits de Controle, a Unidade de controle envia o código da mensagem que ela quer mostrar no display para a memória de mensagens.

| CH3 | CH2 | CH1 | Mensagem: |
|---|---|---|---|
| 0 | 0 | 0 | Display Limpo |
| 0 | 0 | 1 | Chovendo ! |
| 0 | 1 | 0 | Tempo Seco ! |
| 0 | 1 | 1 | Bluetooth: on |
| 1 | 0 | 0 | Bluetooth: off |
| 1 | 0 | 1 | Sensor Desligado / Bluetooth: off |
| 1 | 1 | 0 | Bluetooth: Reset |



---

# Palavras Chave

Verilog; FPGA; Quartus Prime; Detector de Chuva; HDL; rain detector; projeto acadêmico; lógica digital; simulação digital; eletrônica digital; sensores; sistemas embarcados; hardware description language; engenharia elétrica; DE0-Nano




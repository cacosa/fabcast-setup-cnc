# FABCAST Setup CNC — V1

Primeira versão funcional, sem importação dos dados antigos.

Inclui:
- criação, edição, pesquisa, filtros e eliminação de setups;
- código interno da peça opcional;
- ID automático por setup;
- montagem/notas;
- máximo de 2 fotografias;
- tabela expansível de ferramentas;
- validação do código interno de ferramenta FABCAST: 8 dígitos e começa por 5;
- tabela expansível de origens;
- geração de folha CNC A4: página 1 ferramentas, página 2 origens.

Teste local: abra `index.html` num browser moderno. Os dados ficam no `localStorage` do browser.

`supabase_schema.sql` contém a estrutura proposta para a versão Supabase.

# FABCAST Setup CNC — V1.1 Supabase

Versão ligada ao projeto Supabase real.

## Configuração embutida
- Project URL: `https://sxjvcogannhewhoovdar.supabase.co`
- Publishable key: incluída no `index.html`
- Bucket privado: `setup-fotos`

A publishable key é própria para frontend. Não usar service_role/secret key no browser.

## Funcionalidades
- login por email/password via Supabase Auth;
- leitura e escrita de setups;
- ferramentas por setup;
- origens por setup;
- até 2 fotos por setup no Storage privado;
- limite de 1 MB por foto;
- signed URLs para visualizar fotos privadas;
- geração de folha CNC A4 (ferramentas + origens);
- filtros e pesquisa.

## Antes de publicar
Confirme no Supabase:
- RLS ativo;
- policies `authenticated` criadas nas 4 tabelas;
- policies `authenticated` no bucket `setup-fotos`;
- utilizador criado em Authentication > Users.

## Publicação
Pode substituir o `index.html` do repositório GitHub `fabcast-setup-cnc` por este ficheiro.

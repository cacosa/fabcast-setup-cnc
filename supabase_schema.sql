create extension if not exists pgcrypto;

create table if not exists setups (
  id uuid primary key default gen_random_uuid(),
  codigo_peca varchar(8),
  designacao text not null,
  cliente text,
  operacao text not null,
  maquina text not null,
  programa_cnc text,
  desenho text,
  revisao text,
  estado text not null default 'Ativo' check (estado in ('Ativo','Em revisão','Arquivado')),
  montagem_notas text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint codigo_peca_8_digitos check (codigo_peca is null or codigo_peca ~ '^[0-9]{8}$')
);

create table if not exists setup_ferramentas (
  id uuid primary key default gen_random_uuid(),
  setup_id uuid not null references setups(id) on delete cascade,
  posicao_t text,
  tipo text,
  codigo_interno varchar(8),
  suporte text,
  diametro numeric,
  comp_ferramenta numeric,
  comp_alonga numeric,
  ordem integer not null default 0,
  created_at timestamptz not null default now(),
  constraint codigo_ferramenta_fabcast check (codigo_interno is null or codigo_interno ~ '^5[0-9]{7}$')
);

create table if not exists setup_origens (
  id uuid primary key default gen_random_uuid(),
  setup_id uuid not null references setups(id) on delete cascade,
  origem text not null,
  x numeric, y numeric, z numeric,
  a numeric, b numeric, c numeric,
  notas text,
  ordem integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists setup_fotos (
  id uuid primary key default gen_random_uuid(),
  setup_id uuid not null references setups(id) on delete cascade,
  storage_path text not null,
  legenda text,
  ordem smallint not null check (ordem between 1 and 2),
  created_at timestamptz not null default now(),
  unique(setup_id, ordem)
);

create index if not exists idx_setups_codigo on setups(codigo_peca);
create index if not exists idx_setups_cliente on setups(cliente);
create index if not exists idx_setups_maquina on setups(maquina);
create index if not exists idx_setups_programa on setups(programa_cnc);
create index if not exists idx_tools_setup on setup_ferramentas(setup_id);
create index if not exists idx_origins_setup on setup_origens(setup_id);
create index if not exists idx_photos_setup on setup_fotos(setup_id);

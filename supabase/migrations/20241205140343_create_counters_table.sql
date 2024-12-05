create table
    counters (
        id bigint generated by default as identity primary key,
        date date not null unique,
        visitor integer default 0,
        whatsapp_click integer default 0
    );

alter table counters enable row level security;

create policy "Auth users can see counters" on counters for
select
  to authenticated using (true);

create policy "Public can create new counters" on counters for insert to anon
with
  check (true);

create policy "Public can increase existing counters" on counters for update to anon
with
  check (true);
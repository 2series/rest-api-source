-- Find the distribution of pokemon variants by counting how many variants each base Pokemon has
WITH base_names AS (
  SELECT REGEXP_REPLACE(name, '-.*$', '') as base_name,
         name as full_name
  FROM pokemon
)
SELECT 
  base_name,
  COUNT(*) as variant_count,
  STRING_AGG(full_name, ', ') as variants
FROM base_names
GROUP BY base_name
HAVING COUNT(*) > 1
ORDER BY variant_count DESC
LIMIT 10;
-- This shows Pokemon with the most forms/variants. E.g, group "pikachu", "pikachu-gmax", etc. together.

-- Analyse the running patterns of regional variants
SELECT
  REGEXP_EXTRACT(name, '-(hisui|galar|alola|paldea)') as region,
  COUNT(*) as pokemon_count,
  STRING_AGG(name, ', ') as pokemon_list
FROM pokemon
WHERE name REGEXP '-(hisui|galar|alola|paldea)'
GROUP BY region
ORDER BY pokemon_count DESC
LIMIT 10;
-- This shows how many Pokemon variants exist for each region (Hisui, Galar, Alola, Paldea) and lists them.

-- Find Pokemon that have Gigantamax forms
SELECT 
  REGEXP_REPLACE(name, '-gmax', '') as base_pokemon,
  url as gmax_form_url
FROM pokemon 
WHERE name LIKE '%-gmax'
ORDER BY base_pokemon;
-- This identifies all Pokemon that have Gigantamax forms, which is a special battle mechanic introduced in the Sword/Shield games.
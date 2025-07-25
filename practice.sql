-- 問1
-- 国名を全て抽出してください。
SELECT
    name
FROM
    countries;

-- 問2
-- ヨーロッパに属する国をすべて抽出してください。
SELECT
    *
FROM
    countries
WHERE
    continent = 'Europe';

-- 問3
-- ヨーロッパ以外に属する国をすべて抽出してください。
SELECT
    *
FROM
    countries
WHERE
    NOT continent = 'Europe';

-- 問4
-- 人口が10万人以上の国をすべて抽出してください。
SELECT
    *
FROM
    countries
WHERE
    population >= 100000;

-- 問5
-- 平均寿命が56歳から76歳の国をすべて抽出してください。
SELECT
    *
FROM
    countries
WHERE
    life_expectancy >= 56
    AND life_expectancy <= 76;

-- 問6
-- 国コードがNLB,ALB,DZAのもの市区町村をすべて抽出してください。
SELECT
    *
FROM
    cities
WHERE
    country_code IN('NLB', 'ALB', 'DZA');

-- 問7
-- 独立独立記念日がない国をすべて抽出してください。
SELECT
    *
FROM
    countries
WHERE
    indep_year IS NULL;

-- 問8
-- 独立独立記念日がある国をすべて抽出してください。
SELECT
    *
FROM
    countries
WHERE
    indep_year IS NOT NULL;

-- 問9
-- 名前の末尾が「ia」で終わる国を抽出してください。
SELECT
    *
FROM
    countries
WHERE
    name LIKE '%ia';

-- 問10
-- 名前の中に「st」が含まれる国を抽出してください。
SELECT
    *
FROM
    countries
WHERE
    name LIKE '%st%';

-- 問11
-- 名前が「an」で始まる国を抽出してください。
SELECT
    *
FROM
    countries
WHERE
    name LIKE 'An%';

-- 問12
-- 全国の中から独立記念日が1990年より前または人口が10万人より多い国を全て抽出してください。
SELECT
    *
FROM
    countries
WHERE
    indep_year IS NOT NULL
    AND (
        (indep_year < 1990)
        OR (population > 100000)
    );

-- 問13
-- コードがDZAもしくはALBかつ独立記念日が1990年より前の国を全て抽出してください。
SELECT
    *
FROM
    countries
WHERE
    code IN('ALB', 'DZA')
    AND indep_year IS NOT NULL
    AND indep_year < 1990;

-- 問14
-- 全ての地方をグループ化せずに表示してください。
SELECT
    region
FROM
    countries;

-- 問15
-- 国名と人口を以下のように表示させてください。シングルクォートに注意してください。
-- 「Arubaの人口は103000人です」
SELECT
    CONCAT(name, 'の人口は', population, '人です') AS POPULATION
FROM
    countries;

-- 問16
-- 平均寿命が短い順に国名を表示させてください。ただしNULLは表示させないでください。
SELECT
    name,
    life_expectancy
FROM
    countries
WHERE
    life_expectancy IS NOT NULL
ORDER BY
    life_expectancy ASC;

-- 問17
-- 平均寿命が長い順に国名を表示させてください。ただしNULLは表示させないでください。
SELECT
    name,
    life_expectancy
FROM
    countries
WHERE
    life_expectancy IS NOT NULL
ORDER BY
    life_expectancy DESC;

-- 問18
-- 平均寿命が長い順、独立記念日が新しい順に国を表示させてください。
SELECT
    name,
    life_expectancy,
    indep_year
FROM
    countries
WHERE
    life_expectancy IS NOT NULL
ORDER BY
    life_expectancy DESC,
    indep_year DESC NULLS LAST;

-- 問19
-- 全ての国の国コードの一文字目と国名を表示させてください。
SELECT
    SUBSTRING(code, 1, 1) AS "SUBSTRING(code,1,1)",
    name
FROM
    countries;

-- 問20
-- 国名が長いものから順に国名と国名の長さを出力してください。
SELECT
    name,
    LENGTH(name) AS "LENGTH(name)"
FROM
    countries
ORDER BY
    LENGTH(name) DESC;

-- 問21
-- 全ての地方の平均寿命、平均人口を表示してください。(NULLも表示)
SELECT
    region,
    AVG(life_expectancy) AS 平均寿命,
    AVG(population) AS 平均人口
FROM
    countries
GROUP BY
    region
ORDER BY
    region;

-- 問22
-- 全ての地方の最長寿命、最大人口を表示してください。(NULLも表示)
SELECT
    region,
    MAX(life_expectancy) AS 最大寿命,
    MAX(population) AS 最大人口
FROM
    countries
GROUP BY
    region
ORDER BY
    region;

-- 問23
-- アジア大陸の中で最小の表面積を表示してください
SELECT
    MIN(surface_area) AS "アジア大陸の最小表面積"
FROM
    countries
WHERE
    continent = 'Asia'
GROUP BY
    continent;

-- 問24
-- アジア大陸の表面積の合計を表示してください。
SELECT
    SUM(surface_area) AS "アジア大陸の表面積の合計"
FROM
    countries
WHERE
    continent = 'Asia'
GROUP BY
    continent;

-- 問25
-- 全ての国と言語を表示してください。一つの国に複数言語があると思いますので同じ国名を言語数だけ出力してください。
SELECT
    countries.name AS 国名,
    country_languages.language
FROM
    countries
    JOIN country_languages ON countries.code = country_languages.country_code;

-- 問26
-- 全ての国と言語と市区町村を表示してください。
SELECT
    countries.name AS 国名,
    cities.name AS 市区町村名,
    country_languages.language
FROM
    countries FULL
    JOIN country_languages ON countries.code = country_languages.country_code FULL
    JOIN cities ON countries.code = cities.country_code
ORDER BY
    countries.code,
    cities.id;

-- 問27
-- 全ての有名人を出力してください。左側外部結合を使用して国名なし（country_codeがNULL）も表示してください。
SELECT
    celebrities.name,
    countries.name
FROM
    celebrities
    LEFT JOIN countries ON celebrities.country_code = countries.code;

-- 問28
-- 全ての有名人の名前,国名、第一言語を出力してください。
SELECT
    celebrities.name,
    countries.name,
    country_languages.language
FROM
    countries
    JOIN celebrities ON celebrities.country_code = countries.code
    JOIN country_languages ON countries.code = country_languages.country_code
WHERE
    country_languages.is_official = 'T'
ORDER BY
    celebrities.id;

-- 問29
-- 全ての有名人の名前と国名をに出力してください。 ただしテーブル結合せずサブクエリを使用してください。
SELECT
    celebrities.name,
    (
        SELECT
            name
        FROM
            countries
        WHERE
            code = celebrities.country_code
    ) AS "国名"
FROM
    celebrities;

-- 問30
-- 最年長が50歳以上かつ最年少が30歳以下の国を表示させてください。
SELECT
    countries.code,
    MAX(celebrities.age) AS "MAX(ce.age)",
    MIN(celebrities.age) AS "MIN(ce.age)"
FROM
    countries
    JOIN celebrities ON countries.code = celebrities.country_code
GROUP BY
    countries.code
HAVING
    MAX(celebrities.age) >= 50
    AND MIN(celebrities.age) <= 30;

-- 問31
-- 1991年生まれと、1981年生まれの有名人が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
SELECT
    '1991年' AS "誕生年",
    COUNT(*) AS "人数"
FROM
    celebrities
WHERE
    birth >= '1991-01-01'
    AND birth < '1992-01-01'
UNION
SELECT
    '1981年' AS "誕生年",
    COUNT(*) AS "人数"
FROM
    celebrities
WHERE
    birth >= '1981-01-01'
    AND birth < '1982-01-01';

-- 問32
-- 有名人の出身国の平均年齢を高い方から順に表示してください。ただし、FROM句はcountriesテーブルとしてください。
SELECT
    countries.name AS "国名",
    AVG(celebrities.age) AS "平均年齢"
FROM
    countries
    JOIN celebrities ON countries.code = celebrities.country_code
GROUP BY
    countries.name
ORDER BY
    AVG(celebrities.age) DESC;
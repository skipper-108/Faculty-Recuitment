-- General Instructions
-- 1.	The .sql files are run automatically, so please ensure that there are no syntax errors in the file. If we are unable to run your file, you get an automatic reduction to 0 marks.
-- Comment in MYSQL 

-- PRAKHAR SHUKLA
-- Roll Number : 2201CS54

use tut9;

-- Query 1
SELECT player_name
FROM players
WHERE batting_hand = 'Left_Hand' AND country_name = 'England'
ORDER BY player_name;

-- Query 2
SELECT player_name, FLOOR(DATEDIFF('2018-12-02', dob) / 365) AS player_age
FROM players
WHERE bowling_skill = 'Legbreak googly' AND FLOOR(DATEDIFF('2018-12-02', dob) / 365) >= 28
ORDER BY player_age DESC, player_name;

-- Query 3
SELECT match_id, toss_winner
FROM matches
WHERE toss_decision = 'Bat'
ORDER BY match_id;

-- Query 4
SELECT over_id, SUM(runs_scored) AS total_runs
FROM balls
WHERE match_id = 335987 AND runs_scored <= 7
GROUP BY over_id
ORDER BY total_runs DESC, over_id;

-- Query 5
SELECT DISTINCT p.player_name
FROM players p
INNER JOIN dismissals d ON p.player_id = d.player_out
WHERE d.kind_out = 'Bowled'
ORDER BY p.player_name;

-- Query 6
SELECT m.match_id, t1.name AS team_1, t2.name AS team_2, CASE WHEN m.match_winner = t1.team_id THEN t1.name ELSE t2.name END AS winning_team_name, m.win_margin
FROM matches m
JOIN teams t1 ON m.team_1 = t1.team_id
JOIN teams t2 ON m.team_2 = t2.team_id
WHERE m.win_margin >= 60
ORDER BY m.win_margin, m.match_id;

-- Query 7
SELECT player_name
FROM players
WHERE batting_hand = 'Left_Hand' AND FLOOR(DATEDIFF('2018-12-02', dob) / 365) < 30
ORDER BY player_name;

-- Query 8
SELECT match_id, SUM(runs_scored) AS total_runs
FROM balls
GROUP BY match_id
ORDER BY match_id;

-- Query 9
WITH MaxRunsPerOver AS (
    SELECT match_id, over_id, MAX(runs_scored) AS max_runs
    FROM balls
    GROUP BY match_id, over_id
)
SELECT m.match_id, mpo.over_id, mpo.max_runs, p.player_name
FROM MaxRunsPerOver mpo
JOIN balls b ON mpo.match_id = b.match_id AND mpo.over_id = b.over_id AND mpo.max_runs = b.runs_scored
JOIN players p ON b.bowler = p.player_id
ORDER BY m.match_id, mpo.over_id;

-- Query 10
SELECT p.player_name, COUNT(*) AS number
FROM dismissals d
JOIN players p ON d.player_out = p.player_id
WHERE d.kind_out = 'Run out'
GROUP BY p.player_name
ORDER BY number DESC, p.player_name;

-- Query 11
SELECT kind_out, COUNT(*) AS number
FROM dismissals
GROUP BY kind_out
ORDER BY number DESC, kind_out;

-- Query 12
SELECT t.name, COUNT(*) AS number
FROM matches m
JOIN teams t ON m.match_winner = t.team_id
GROUP BY t.name
ORDER BY t.name;

-- Query 13
SELECT venue
FROM (
    SELECT venue, COUNT(*) AS wides_count
    FROM balls
    WHERE extra_type = 'Wides'
    GROUP BY venue
) AS venue_wides
ORDER BY wides_count DESC, venue
LIMIT 1;

-- Query 14
SELECT venue
FROM (
    SELECT venue, COUNT(*) AS num_wins
    FROM matches
    WHERE toss_winner = match_winner
    GROUP BY venue
) AS win_venues
ORDER BY num_wins DESC, venue;

-- Query 15
SELECT p.player_name
FROM (
    SELECT bowler, COUNT(*) AS wickets, SUM(runs_given) AS runs_given
    FROM balls
    WHERE kind_out <> 'Not out'
    GROUP BY bowler
) AS wickets_table
JOIN players p ON wickets_table.bowler = p.player_id
ORDER BY (runs_given / wickets) ASC, p.player_name
LIMIT 1;

-- Query 16
SELECT p.player_name, t.name
FROM (
    SELECT match_winner, player_out
    FROM matches
    JOIN dismissals ON matches.match_id = dismissals.match_id
    WHERE role = 'CaptainKeeper'
) AS match_captains
JOIN players p ON match_captains.player_out = p.player_id
JOIN teams t ON p.team_id = t.team_id
ORDER BY p.player_name;

-- Query 17
SELECT p.player_name, SUM(b.runs_scored) AS runs_scored
FROM balls b
JOIN players p ON b.striker = p.player_id
GROUP BY p.player_name
HAVING SUM(b.runs_scored) >= 50
ORDER BY runs_scored DESC, p.player_name;

-- Query 18
SELECT p.player_name
FROM balls b
JOIN players p ON b.striker = p.player_id
JOIN dismissals d ON b.match_id = d.match_id AND b.over_id = d.over_id AND b.ball_id = d.ball_id
JOIN matches m ON b.match_id = m.match_id
WHERE b.runs_scored >= 100 AND m.match_winner <> b.team_batting
ORDER BY p.player_name;

-- Query 19
SELECT match_id, venue
FROM matches
WHERE (team_1 = 'KKR' OR team_2 = 'KKR') AND match_winner <> 'KKR'
ORDER BY match_id;

-- Query 20
SELECT p.player_name
FROM balls b
JOIN players p ON b.striker = p.player_id
JOIN matches m ON b.match_id = m.match_id
WHERE m.season_id = 5 AND b.innings_no <= 4
GROUP BY p.player_name
HAVING COUNT(DISTINCT m.match_id) = 10
ORDER BY (SUM(b.runs_scored) / COUNT(DISTINCT m.match_id)) DESC, p.player_name
LIMIT 10;

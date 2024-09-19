local client = require("obsidian").get_client()
local note = client.current_note(client)

--print(client.list_tags(client))
-- this is true, which is problematic !!
--print(client.should_save_frontmatter(client,note))
--
print(note:frontmatter_lines())

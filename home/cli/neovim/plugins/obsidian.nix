{
  programs.nixvim = {
    plugins.obsidian = {
      enable = true;

      settings = {
        completion = {
          min_chars = 4;
          nvim-cmp = true;
        };

        notes_subdir = "zettelkasten";
        new_notes_location = "notes_subdir";

        workspaces = [
          {
            name = "cerebrum";
            path = "/home/redha/mount/obsidian/cerebrum";
          }
        ];


        templates = {
          subdir = "/home/redha/cerebrum/templates/obsidian.nvim";
        };

        note_id_func =
        ''
          function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            local output = ""
            if title ~= nil then
              -- If title is given, transform it into valid file name.
              output = title
            else
              -- If title is nil, just add 4 random uppercase letters to the suffix.
              for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
              end
              output = "new note - "
            end
            return output .. "-" .. suffix
          end
        '';

        note_frontmatter_func =
        ''
          function(note)
            -- Add a default template.
            my_id = os.date("%Y%m%d%H%M")
            local out = {id = my_id}

            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
              for k, v in pairs(note.metadata) do
                out[k] = v
              end
            end

            return out
          end
        '';

        note_path_func =
        ''
          function(spec)
            -- Save notes with their title
            local path = spec.dir / tostring(spec.title)
            return path:with_suffix(".md")
          end
        '';

        mappings =
        {
          "<leader>oc" = {
            action = "require('obsidian').util.toggle_checkbox";
            opts = {
              buffer = true;
            };
          };
          gf = {
            action = "require('obsidian').util.gf_passthrough";
            opts = {
              buffer = true;
              expr = true;
              noremap = false;
            };
          };
        };

        picker =
        {
          name = "telescope.nvim";
          note_mappings =
          {
            insert_link = "<A-l>";
            new = "<A-n>";
          };

          tag_mappings =
          {
            insert_tag = "<A-t>";
          };
        };

      };
    };
  };
}

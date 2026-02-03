local record lunamark

   record entities
      dec_entity: function(s: string): string
      hex_entity: function(s: string): string
      char_entity: function(s: string): string
   end

   record reader

      record markdown
         interface Options
            alter_syntax: function(syntax: any): any
            references: table
            preserve_tabs: boolean
            smart: boolean
            startnum: boolean
            notes: boolean
            definition_lists: boolean
            pandoc_title_blocks: boolean
            lua_metadata: boolean
            require_blank_before_blockquote: boolean
            require_blank_before_header: boolean
            hash_enumerators: boolean
         end

         -- returns a converter function
         new: function(
            writer: lunamark.writer.generic.Writer,
            options?: Options
         ): function(markdown: string): (string, table)
      end
   end

   record writer
      record generic

         interface Options
            layout: string
         end

         interface Writer
         -- metadata
         set_metadata: function(key: string, val: any)
         add_metadata: function(key: string, val: any)
         get_metadata: function(): {string: any}

         -- document lifecycle
         start_document: function()
         stop_document: function()

         -- constants / strings
         space: string
         linebreak: string
         interblocksep: string
         containersep: string
         ellipsis: string
         mdash: string
         ndash: string

         -- inline / text
         plain: function(s: table): table
         string: function(s: string): string
         code: function(s: table): string
         emphasis: function(s: table): table
         strong: function(s: table): table
         singlequoted: function(s: table): table
         doublequoted: function(s: table): table

         -- html passthrough
         inline_html: function(s: string): string
         display_html: function(s: string): string

         -- blocks
         paragraph: function(s: table): table
         blockquote: function(s: table): table
         verbatim: function(s: table): table
         header: function(s: table, level: integer): table
         hrule: string

         -- lists
         bulletlist: function(items: {any}, tight: boolean): string
         orderedlist: function(items: {any}, tight: boolean, startnum?: integer): string
         definitionlist: function(
            items: table,
            tight: boolean
         ): any

         -- links / media
         link: function(label: table, uri: string, title?: string): table
         image: function(label: string, src: string, title?: string): string

         -- notes
         note: function(contents: string): string

         -- template
         template: string
         end

         new: function(options?: Options): Writer
      end

      record html
         interface Options
         containers: boolean
         slides: boolean
         layout: string
         end

         new: function(options?: Options): generic.Writer
      end
   end
end

return lunamark
module Twitter::Response
  struct ExtendedEntities
    JSON.mapping({
                   media: Array(Media)?
                 })
  end
end

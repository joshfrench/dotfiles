return {
  settings = {
    gopls = {
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = false,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true
      },
      formatting = {
        ['local'] = 'github.com/rstudio/'
      }
    }
  }
}

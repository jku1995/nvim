local staus_ok,alpha = pcall(require,"alpha")
if not staus_ok then
  vim.notify("alpha load failed")
return
end

local dashboard_staus_ok,dashboard = pcall(require,'alpha.themes.dashboard')
if not dashboard_staus_ok then
  vim.notify("alpha dashboard load failed")
end

dashboard.section.header.val = {
             [[                               __                ]],
             [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
             [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
             [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
             [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
             [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
         }

alpha.setup(dashboard.config)

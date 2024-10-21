import { Icons } from "@/components/icons"

interface NavItem {
    title: string
    to?: string
    href?: string
    disabled?: boolean
    external?: boolean
    icon?: keyof typeof Icons
    label?: string
}

interface NavItemWithChildren extends NavItem {
    items?: NavItemWithChildren[]
}

export const mainMenu: NavItemWithChildren[] = [
    // {
    //     title: "Home",
    //     to: '',
    // },
    // {
    //     title: "What's new",
    //     items: [
    //         {
    //             title: 'Sample',
    //             to: '/sample',
    //         },
    //         {
    //             title: 'Sample Dua',
    //             to: '/#',
    //         },
    //     ]
    // },
    // {
    //     title: 'About',
    //     to: 'empty',
    // },
]

export const sideMenu: NavItemWithChildren[] = []

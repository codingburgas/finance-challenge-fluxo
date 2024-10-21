interface AppConfig {
    name: string,
    github: {
        title: string,
        url: string
    },
    author: {
        name: string,
        url: string
    },
}

export const appConfig: AppConfig = {
    name: "Fluxo",
    github: {
        title: "Fluxo",
        url: "https://github.com/codingburgas/finance-challenge-fluxo",
    },
    author: {
        name: "hayyi",
        //url: "https://github.com/hayyi2/",
    }
}
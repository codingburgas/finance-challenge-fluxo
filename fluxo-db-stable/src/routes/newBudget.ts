import { Router, Request, Response } from "express";
import { prisma } from "../index"; 

const router = Router();

router.post("/", async (req: Request, res: Response) => {
    try {
        const { email, amountInserted, goal, deadline, category, title } = req.body;
        const user = await prisma.user.findUnique({
            where: { email },
        });

        if (!user) {
            return res.status(404).send({ error: 'User not found' });
        }
        const budget = await prisma.budget.create({
            data: {
                title: title,
                amountInserted: amountInserted,
                category: category,
                goal: goal,
                deadline: deadline,
                userId: user.id,
                
            },
        });

        return res.status(201).json({ budget, user });
        
    } catch (error) {
        console.error(error);
        return res.status(500).send({ error: 'Internal server error' });
    }
});

export default router;
<?php


namespace App\Controller;


use App\Entity\Category;
use App\Repository\CategoryRepository;
use App\Repository\QuestionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Twig\Environment;

class DomainController extends AbstractController
{
    private $twig;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
    }

    /**
     * @Route("/domains", name="categories")
     */
    public function showDomains(CategoryRepository $categoryRepository): Response
    {
        return new Response($this->twig->render('Category/categories.html.twig', [
            'categories' => $categoryRepository->findAll(),
        ]));
    }

}

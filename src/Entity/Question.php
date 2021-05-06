<?php

namespace App\Entity;

use App\Repository\QuestionRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=QuestionRepository::class)
 */
class Question
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $Family;

    /**
     * @ORM\Column(type="array")
     */
    private $Answers = [];

    /**
     * @ORM\Column(type="array")
     */
    private $correctAnswerIndexes;

    /**
     * @ORM\ManyToOne(targetEntity=Category::class, inversedBy="questions")
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;

    /**
     * @ORM\Column(type="integer")
     */
    private $level;

    public function __toString(): string
    {
        return (string) $this->getName();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFamily(): ?string
    {
        return $this->Family;
    }

    public function setFamily(?string $Family): self
    {
        $this->Family = $Family;

        return $this;
    }

    public function getAnswers(): ?array
    {
        return $this->Answers;
    }

    public function setAnswers(array $Answers): self
    {
        $this->Answers = $Answers;

        return $this;
    }

    public function getCorrectAnswerIndexes(): ?array
    {
        return $this->correctAnswerIndexes;
    }

    public function setCorrectAnswerIndexes(array $correctAnswerIndexes): self
    {
        $this->correctAnswerIndexes = $correctAnswerIndexes;

        return $this;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getLevel(): ?int
    {
        return $this->level;
    }

    public function setLevel(int $level): self
    {
        $this->level = $level;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }
}
